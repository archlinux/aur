# Maintainer: fossisawesome <lx bax wp 73 AT moz mail DOT com>
# Repackages the .deb built by the Tauri bundler in release.yml. aur.yml bumps
# pkgver and refreshes the checksum on each release.
pkgname=firmium-desktop-bin
pkgver=9.0.2
pkgrel=1
pkgdesc="Lightning fast OpenSubsonic music player (Tauri 2: Rust + Svelte)"
arch=('x86_64')
url="https://github.com/fossisawesome/firmium"
license=('GPL-3.0-only')
depends=('alsa-lib' 'gtk3' 'webkit2gtk-4.1' 'libsecret' 'openssl' 'xdotool')
provides=('firmium-desktop')
conflicts=('firmium-desktop' 'firmium-desktop-git')
options=('!strip')
noextract=("Firmium_${pkgver}_amd64.deb")
source=("Firmium_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/Firmium_${pkgver}_amd64.deb"
        "LICENSE::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('17ade3a2688ac1b517fe3c895f6748782c5385d5813cdc77a9f7e0ba8a9afa89'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  cd "$srcdir"
  # A .deb is an ar archive: pull out data.tar.*, then unpack it into the package root.
  bsdtar -xf "Firmium_${pkgver}_amd64.deb" 'data.tar.*'
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
