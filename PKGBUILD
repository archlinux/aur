# Maintainer: Philip <philip1731@protonmail.ch>

pkgname=plymouth-theme-dracula-git
pkgver=r4.f315ed5
pkgrel=2
pkgdesc='Plymouth theme with Dracula colours and logo.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/nanophilip/${pkgname}/"
license=('MIT')
depends=('plymouth')
makedepends=('git')
source=("git+https://github.com/nanophilip/${pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"

  for f in bg.png dracula.grub dracula.plymouth dracula.script logo.png pb.png; do
    install -Dm644 "dracula/${f}" "${pkgdir}/usr/share/plymouth/themes/dracula/${f}"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

post_install() {
  echo "==> To activate the theme, run as root:"
  echo "==> plymouth-set-default-theme -R dracula"
}

post_upgrade() {
	post_install $1
}
