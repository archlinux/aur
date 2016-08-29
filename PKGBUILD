# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Contributor: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>
pkgbase=python-nikola
_pynameweb=Nikola
_pyname=nikola
pkgname=('python-nikola' 'python-nikola-doc')
pkgver=7.8.0
pkgrel=2
pkgdesc='A modular, fast, simple, static website generator.'
arch=('any')
url='https://getnikola.com/'
license=('MIT')
options=(!emptydirs)
makedepends=('python' 'python-doit' 'python-pygments' 'python-pillow'
             'python-docutils' 'python-mako' 'python-unidecode' 'python-lxml'
             'python-yapsy>=1.11.223' 'python-pyrss2gen' 'python-dateutil' 'python-logbook'
             'python-blinker' 'python-natsort' 'python-setuptools'
             'python-requests' 'python-husl' 'python-piexif')
source=("https://pypi.io/packages/source/N/Nikola/${_pynameweb}-${pkgver}.tar.gz")
md5sums=('68c20796b28473a5599e2cebccf4ccbd')

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
}

package_python-nikola() {
  depends=('python' 'python-doit' 'python-pygments' 'python-pillow'
           'python-docutils' 'python-mako' 'python-unidecode' 'python-lxml'
           'python-yapsy>=1.11.223' 'python-pyrss2gen' 'python-dateutil' 'python-logbook'
           'python-blinker' 'python-natsort' 'python-setuptools'
           'python-requests' 'python-husl' 'python-piexif')
  optdepends=('python-markdown: for Markdown support'
              'python-jinja: for Jinja2 themes'
              'python-pyphen>=0.9.1: for hyphenation'
              'python-pygal=1.7.0: for SVG graph plotting'
              'python-typogrify>=2.0.4: for typographical enhancements'
              'python-webassets: for bundling assets'
              'ipython-notebook: for ipynb support'
              'ipython: for ipynb support'
              'python-ghp-import>=0.4.1: for uploading to GitHub Pages'
              'python-micawber: for embedding media in posts'
              'python-phpserialize: for WordPress imports'
              'python-ws4py: for nikola auto'
              'python-watchdog: for nikola auto')
  conflicts=('python-nikola-git')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
  rm -rf "${pkgdir}/usr/share"
}

package_python-nikola-doc(){
  pkgdesc="Nikola documentation, license and man page"
  conflicts=('python-nikola-doc-git')

  cd "${srcdir}/${_pyname}-${pkgver}"
  install -d -m755 "${pkgdir}/usr/share"/{doc/${pkgbase},man/man1,licenses/${pkgbase}}
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  cd "docs/"
  install -m644 man/nikola.1.gz "${pkgdir}/usr/share/man/man1/nikola.1.gz"
  install -m644 manual.txt "${pkgdir}/usr/share/doc/${pkgbase}/manual.txt"
  install -m644 theming.txt "${pkgdir}/usr/share/doc/${pkgbase}/theming.txt"
  install -m644 extending.txt "${pkgdir}/usr/share/doc/${pkgbase}/extending.txt"
}

# vim:set ts=2 sw=2 et:
