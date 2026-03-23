# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=mtprotoproxy
pkgver=1.1.2
pkgrel=1
pkgdesc="Telegram MTProto proxy written in pure python"
arch=(any)
url="https://github.com/alexbers/mtprotoproxy"
license=('MIT')
source=("https://github.com/alexbers/mtprotoproxy/archive/v$pkgver.tar.gz"
        "mtprotoproxy.sysusers"
        "mtprotoproxy.service")

depends=('python' 'python-pycryptodome')
sha256sums=('4082ea3875fa524b6c8f3d08208938cdf867a79c2bf99ceda85d57dece868702'
            'df69211596960a17a98eb423df281e925fee4d700ff3b35975cffdb0afa70fa0'
            'df222cc4dfddd5586d674062cfdb1b8b497722e4e4039bb9c41f01b4ce08fed2')
backup=('etc/mtprotoproxy.conf')
package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "mtprotoproxy.py" "$pkgdir/usr/bin/mtprotoproxy"
	install -Dm644 config.py "$pkgdir/etc/mtprotoproxy.conf"
	install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "${srcdir}/mtprotoproxy.service" "$pkgdir/etc/systemd/system/mtprotoproxy.service"
	install -Dm644 "${srcdir}/mtprotoproxy.sysusers" "${pkgdir}/usr/lib/sysusers.d/mtprotoproxy.conf"
}
