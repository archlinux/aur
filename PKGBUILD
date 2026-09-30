# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Maria <maria@kuuro.net>

pkgname=zerobrew-bin
pkgver=0.3.3
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

sha256sums=('a12f5c13b7e08fc18edb8539165ff8eb82095b60e94d79d4d3792634b6625c97'
            'c5a4b4e7f1475fe021600420ddfd2c553fb3a0439863bce2188396a92ce69069'
            '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
sha256sums_x86_64=('75b7663061956f5558cc779497a7ec53188733c3db5b99398c5a194b6f1dfd8d'
                   '280f26ba6f315299b61963e3dc29ab715ff9ef5ca1c20cba1ab68ffc06bd5153')
sha256sums_aarch64=('45cd80d26d6ce32f2392118da90559d0f2a1a7890a445e2d8a3cc4b9c9983069'
                    '20330e973d8bfbed8c695536234ce87631b9b0221d7aa1b6fff33b12f19ac596')


package() {
	cd "${srcdir}/"

	install -Dm755 "zb-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zb"
	install -Dm755 "zbx-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zbx"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
