# Maintainer: notlet <let@notlet.dev>
# Huge thanks to the maintainers of `protonmail-desktop` for the original PKGBUILD

pkgname=protonpass
pkgver=1.17.5
pkgrel=1
pkgdesc="Official desktop application for Proton Pass, repackaged from a .deb"
arch=('x86_64')
url="https://proton.me/pass/download"
license=('unknown')

depends=(
	'gtk3'
	'libnotify'
	'nss'
	'libxtst' 
	'xdg-utils'
	'at-spi2-core'
	'libdrm' 
	'libglvnd'
	'libxcb'
)
optdepends=(
	'kde-cli-tools: file deletion support (kioclient5)'
	'pipewire: WebRTC desktop sharing under Wayland'
	'trash-cli: file deletion support (trash-put)'
	'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)'
)

source=("ProtonPass_${pkgver}.deb::https://proton.me/download/PassDesktop/linux/x64/ProtonPass_${pkgver}.deb")
sha256sums=('d9d9d1ff82e92e242525e6efef8fc5ecbfdae6560f87e00c3ea4152011efc5c8')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"

  # Move main files to proper directory
  mkdir "$pkgdir/opt/"
  mv "$pkgdir"/usr/lib/* "$pkgdir/opt"

  # Replace binary symlink
  ln -sf "$pkgdir/opt/proton-pass/Proton Pass" "$pkgdir/usr/bin/proton-pass"

  # Remove unneeded Electron license & lintian folder
  rm -rf "$pkgdir"/usr/share/{doc,lintian}
}
