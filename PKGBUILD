# Maintainer: thorko contact@thorko.de
pkgname=kibana-tm
pkgver=8.3.2
pkgrel=0
pkgdesc="Kibana"
arch=('x86_64')
url='https://elastic.co'
license=('MIT')
if [ "$CARCH" = "x86_64" ]; then
		source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://artifacts.elastic.co/downloads/kibana/kibana-${pkgver}-linux-x86_64.tar.gz")
		sha256sums=('4dcb87877ff0607766b65aa7323a27595866bd2e1b12e0da7105545a6e198b11')
fi

install=kibana.install

source+=(
  "kibana.service"
  "users.conf"
)

sha256sums+=(
  'fb841a02e3ec5b86c70eb3ea2637d24d0485371e70ccc791ad5b4b43eab7ce95'
  '7f77864171716c227cec2ed72b0374d57a5de24e8b5fe028fb77f52fccccc8f9'
)

package() {
    mkdir -p "${pkgdir}/opt"
    cp -R "${srcdir}/kibana-${pkgver}" "${pkgdir}/opt/kibana"
    install -Dm0644 "kibana.service" "${pkgdir}/etc/systemd/system/kibana.service"
    install -Dm0644 "users.conf" "${pkgdir}/usr/lib/sysusers.d/kibana.conf"
}
