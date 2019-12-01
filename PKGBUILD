# Maintainer: mehalter <micah at mehalter.com>
# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Maintainer: vinipsmaker <vini.ipsmaker@gmail.com>

pkgbase=http-prompt
pkgname=http-prompt
_module='http-prompt'
pkgver='1.0.0'
pkgrel=2
pkgdesc="An interactive HTTP command-line client"
url="https://github.com/eliangcs/http-prompt"
depends=('python'
         'python-click'
         'httpie'
         'python-prompt_toolkit1'
         'python-pygments'
         'python-six'
         'python-parsimonious'
         'python-pip'
         'python-pyaml')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/h/http-prompt/http-prompt-${pkgver}.tar.gz")
md5sums=('aee6b913be3190f66f8765281ce3d8f0')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    sed -e 's/prompt_toolkit/prompt_toolkit1/g' -i http_prompt/*.py
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    sed -e 's/prompt-toolkit/prompt-toolkit1/g' -i \
        "${pkgdir}/usr/lib/python3.8/site-packages/http_prompt-1.0.0-py3.8.egg-info/requires.txt"
}
