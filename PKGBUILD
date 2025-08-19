# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-bin
pkgver=2025.8.0
pkgrel=1
pkgdesc="A secure and free password manager for all of your devices."
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'libnotify'
  'org.freedesktop.secrets'
  'libxtst'
  'libxss'
  'libnss_nis'
  'nss'
)
install="${pkgname%-bin}.install"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/bitwarden/clients/releases/download/desktop-v$pkgver/Bitwarden-$pkgver-amd64.deb"
        "${pkgname%-bin}.sh")
sha512sums=('e2dd9ac393085f8d8d56c199e6f1425b06bc89973f8a3cbc0ff13de1b8b1dbbd7b52d6c5b9052de3578a2fa2b65cb3fe73b05c777a2103db75ba84a33e224a38'
            'b263968cafae65e2456f1ba6bc9fad3c2e5b502ef74b519866c9d028059442f56bf0579cdad9fd74e30d4352e05f72fc9b8e045d80bd49f0a43c113215431014')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

  desktop-file-edit --set-key=Exec --set-value="${pkgname%-bin} %U" \
    "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"

	install -Dm755 "${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
}
