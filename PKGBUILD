# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Maria <maria@kuuro.net>

pkgname=zerobrew-bin
pkgver=0.4.0
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

sha256sums=('575ce9bea4fff2970908836e8e0d44a5237c454788265c519857d51d08d2cbd2'
            'c5a4b4e7f1475fe021600420ddfd2c553fb3a0439863bce2188396a92ce69069'
            '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
sha256sums_x86_64=('845277fa4597f0475cdf0cf1ac01cec54e79c20374d1b5757b284448e101362f'
                   '280f26ba6f315299b61963e3dc29ab715ff9ef5ca1c20cba1ab68ffc06bd5153')
sha256sums_aarch64=('092d098fa365b28337bad94804e0d942647fb405f1479a4a02ae53c485ac5449'
                    '7ce6097f8365974518d25549a65773dd265b070b47749d04f09863a9ced0ed59')


package() {
	cd "${srcdir}/"

	install -Dm755 "zb-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zb"
	install -Dm755 "zbx-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zbx"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
