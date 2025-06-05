# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-bin
pkgver=2025.5.1
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
sha512sums=('406b95fc0efd67699f7f79f4ddff3a1c54fe5766c480bf81f5219328fdba35320f057fac56fd9633126144c4c33fdf62a6872695505f74518eb13fbeb873e445'
            'b263968cafae65e2456f1ba6bc9fad3c2e5b502ef74b519866c9d028059442f56bf0579cdad9fd74e30d4352e05f72fc9b8e045d80bd49f0a43c113215431014')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

  desktop-file-edit --set-key=Exec --set-value="${pkgname%-bin} %U" \
    "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"

	install -Dm755 "${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
}
