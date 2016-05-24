# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=letsencrypt.sh-git
pkgver=0.2.0.r4.gd5b2858
pkgrel=1

arch=('any')
license=('MIT')
pkgdesc="A Let's Encrypt (ACME protocol) client shell script"
url='https://github.com/lukas2511/letsencrypt.sh'

source=("${pkgname}::git+https://github.com/lukas2511/letsencrypt.sh.git"
        'letsencrypt.sh.timer'
        'letsencrypt.sh.service')

sha256sums=('SKIP'
            'c2b5556776d20a2a8610e70d10eb2bf830ec5ac725be641ea0fe42945641d684'
            '2fa8367f86a173a262c46804849fbeaf0180a36d6cad83e6927f7d245e8c9f77')

depends=('curl' 'openssl')
makedepends=('git')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
	install -Dm755 -t "${pkgdir}/usr/bin/" letsencrypt.sh
	install -Dm644 -t "${pkgdir}/etc/letsencrypt.sh/examples/" docs/examples/*
	install -Dm644 -t "${pkgdir}/usr/share/docs/letsencrypt.sh/" docs/*.md
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" ../letsencrypt.sh.timer ../letsencrypt.sh.service
}
