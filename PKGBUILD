# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_name=ttime
pkgname=${_name}-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A working and customizable countdown timer in the terminal"
arch=('x86_64')
url="https://github.com/Techsmith404/${_name}"
_urlraw="https://raw.githubusercontent.com/Techsmith404/${_name}/v${pkgver}"
license=('GPL-3.0-only')

makedepends=('python-pip' 'python-setuptools' 'python-wheel')
depends=('python' 'python-rich' 'python-pyfiglet' 'python-playsound3')
provides=("${_name}")

_whl="ttime-${pkgver}-py3-none-any.whl"

options=('!strip')
noextract=("${_whl}")
source=("${url}/releases/download/v${pkgver}/${_whl}"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
sha512sums=('1068184b1b30e420a96e72352eb16eec20d100e294bbc6bf49cdacc57cb16b99cdd8631c37f8ec2a21fe0d532d7cce4bbdd25870b691658c6ebf7718391e3432'
            '8079dd70374e182cc3110572af073f53a5fe1b0c044a31d959c0becdd0dbfeb3a939c5dd5f286aa3de859af981948a75b7001bf5425f2b70b2057271a228e08f'
            'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
