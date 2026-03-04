# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_exec=yt
_name=yewtube
pkgname=${_name}-bin
pkgver=2.13.1
pkgrel=1
pkgdesc="Terminal-based YouTube player and downloader"
arch=('x86_64')
url="https://github.com/mps-youtube/${_name}"
_urlraw="https://raw.githubusercontent.com/mps-youtube/${_name}/v${pkgver}"
license=('GPL-3.0-only')

makedepends=('python-pip' 'python-setuptools' 'python-wheel')
depends=('glib2' 'yt-dlp' 'python' 'python-colorama' 'python-pyperclip' 'python-dbus' 'python-qrcode' 'python-requests' 'python-gobject' 'python-pylast' 'python-youtube-search-python')
provides=("${_exec}")

_whl="${_name}-${pkgver}-py3-none-any.whl"

options=('!strip')
noextract=("${_whl}")
source=("${url}/releases/download/v${pkgver}/${_whl}"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
sha512sums=('6617d5244f3ad4293a1393e4ca52073d51a82e65d703f72a21eeabc4e47c067ab6b3b80b600ec9509acd4f72b2e0a758870a48233b75f3590a2ea3d00f527294'
            '6e159f0b5db8ea4fc4890a100c9297bed238354b9be830846054ebe9e2b0395cb68510b1f5b2b2723dc456ebacd935868d26240f94cc647a5f32a9871d2e9bff'
            '0e95534e87b7ded60d662d729a1546bf271d63ee3fc12025068bc0fa42d2dc7f2b60ed42032e2b2f1bc32ba973cffbad4c8e6350cb1c1e3e3862be6eb2745585')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
