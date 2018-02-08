# Maintainer: ArchStrike <team@archstrike.org>

buildarch=128

pkgname=teamsql
pkgver=3.0.167
pkgrel=1
pkgdesc="Multi-Platform SQL Client"
url="https://teamsql.io/"
arch=('x86_64')
license=('custom:https://teamsql.io/end-user-licence-agreement')
depends=("libappindicator" "libnotify" "gconf" "libxtst" "libxss" "nss" "alsa-lib")
source=("TeamSQL-${pkgver}.deb::https://dlpuop5av9e02.cloudfront.net/linux/stable/${pkgver}/TeamSQL-${pkgver}.deb"
				"LICENSE::https://teamsql.io/end-user-licence-agreement")
sha512sums=('bf2643d499c71d9b8d392bba2754b4f625bd28ccad8e4ebab7b66766db3c65f9e87a3a83ff56fee554a89915a24e508e61bac51f30722507bbbdf195df15d5e3'
						'04cfad055d5baf7ecd4c52eda6afee8d254180f8b30de72f0b48ad99b2a1dd4188739a274f53ce5579585c65d57bbfe30eab68169357bc4955a44e7df44f9269')

package() {
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	bsdtar -xf data.tar.xz -C "$pkgdir/"

cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/usr/bin/env bash
exec /opt/TeamSQL/TeamSQL "\$@"
EOF

	chmod 755 "$pkgdir/usr/bin/$pkgname"
}

# vim:se ts=2 sw=2 et:
