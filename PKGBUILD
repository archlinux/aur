# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=arch-man-bot-git
pkgver=r8.6b20f92
pkgrel=1
pkgdesc="Telegram bot for in-line search of man-pages"
arch=('any')
url="https://t.me/archmanbot"
license=('GPL3')
depends=('python-pytelegrambotapi')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=${pkgname%-git}.install
source=("${pkgname%-git}::git+https://github.com/alcortazzo/arch-man-bot.git"
        "systemd-credential-pass.patch"
        "${pkgname%-git}.service")
sha512sums=('SKIP'
            'f251be80736216f8c23b4e0c27b6c5aa2d129ec9957ef160dc5c83bd7b40f56733a52936f343734cdd699dbf4a1703ed520912332d48a2ac93ac9614f09ecb7f'
            '33c98561c766ca7cbe524b148e04e17061b3966ed99e991e5178958149adc817d2d83a62d87b673343fd972da81d5e5aaf900b747eaef4c1e808d782584294a9')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-git}"
	patch -p1 -i "$srcdir/systemd-credential-pass.patch"
}

package() {
	cd "${pkgname%-git}"
	install -vDm 775 "main.py" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -vDm 644 "../${pkgname%-git}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
