# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Maria <maria@kuuro.net>

pkgname=zerobrew-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='A drop-in, 5-20x faster, experimental Homebrew alternative'

arch=('x86_64' 'aarch64')
license=('MIT' 'Apache-2.0')
url='https://github.com/lucasgelfond/zerobrew'

depends=('glibc' 'libgcc')

conflicts=('zerobrew')
provides=('zb' 'zbx')

options=('!strip' '!debug')

source=(
  "README-${pkgver}.md::https://raw.githubusercontent.com/lucasgelfond/zerobrew/v${pkgver}/README.md"
  "LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/lucasgelfond/zerobrew/v${pkgver}/LICENSE-MIT.md"
  "LICENSE-APACHE-${pkgver}::https://raw.githubusercontent.com/lucasgelfond/zerobrew/v${pkgver}/LICENSE-APACHE.md"
)
source_x86_64=(
  "zb-${pkgver}-${arch[0]}::${url}/releases/download/v${pkgver}/zb-linux-x64"
  "zbx-${pkgver}-${arch[0]}::${url}/releases/download/v${pkgver}/zbx-linux-x64"
)
source_aarch64=(
  "zb-${pkgver}-${arch[1]}::${url}/releases/download/v${pkgver}/zb-linux-arm64"
  "zbx-${pkgver}-${arch[1]}::${url}/releases/download/v${pkgver}/zbx-linux-arm64"
)

sha256sums=('15ce32f1792f63c0fca75928fa65924434b559dbc8a52c789ff40f606c7a039f'
            'c5a4b4e7f1475fe021600420ddfd2c553fb3a0439863bce2188396a92ce69069'
            '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
sha256sums_x86_64=('a70770ec75e124b43b91e90828d1e60c03a6361c47f5a35ed2ad3eb1051fb014'
                   'e3af1bfb92113ee66515a1f99eb96bb93a564472ce270467d9f2087062fbb510')
sha256sums_aarch64=('5a3c3d37884bfd2e3c4283f28432543826e2e350c309c579d93c4cd735348374'
                    '12fc260ca93deaf19de6b86fd496d32dcd94268ac05410f75fe3bac9c9ac1340')


package() {
	cd "${srcdir}/"

	install -Dm755 "zb-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zb"
	install -Dm755 "zbx-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zbx"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
