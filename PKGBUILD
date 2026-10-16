# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Maria <maria@kuuro.net>

pkgname=zerobrew-bin
pkgver=0.4.1
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
sha256sums_x86_64=('471b4735efbb07ff6affb985df455d6c8e67a292878c3d00912ad7942639002d'
                   '7ae8a38c679efc95a3b90620e5549b51fae5af0b3bc358b092b889dbb6c3df8f')
sha256sums_aarch64=('fb3d5f44fd2d6fb6dea6bb303f665f8fbb683ef06791313414de1d4487d56a96'
                    'eed2e11c2b827f24b4074d81f5f58291eaba2e0d44fd72501819e63752d2b0e1')


package() {
	cd "${srcdir}/"

	install -Dm755 "zb-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zb"
	install -Dm755 "zbx-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zbx"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
