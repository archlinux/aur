# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Contributor: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>
pkgbase=python-nikola
_pyname=nikola
pkgname=('python-nikola' 'python2-nikola' 'python-nikola-doc')
pkgver=7.6.1
pkgrel=2
pkgdesc='A modular, fast, simple, static website generator.'
arch=('any')
url='https://getnikola.com/'
license=('MIT')
options=(!emptydirs)
makedepends=('python' 'python-doit' 'python-pygments' 'python-pillow'
             'python-docutils' 'python-mako' 'python-unidecode' 'python-lxml'
             'python-yapsy>=1.11.223' 'python-pyrss2gen' 'python-dateutil' 'python-logbook'
             'python-blinker' 'python-natsort' 'python-setuptools' 'python-requests'
             'python2' 'python2-doit' 'python2-pygments' 'python2-pillow'
             'python2-docutils' 'python2-mako' 'python2-unidecode' 'python2-lxml'
             'python2-yapsy>=1.11.223' 'python2-pyrss2gen' 'python2-dateutil' 'python2-logbook'
             'python2-blinker' 'python2-natsort' 'python2-setuptools' 'python2-requests')
# .tgz for botched release (again, sorry!)
source=("https://pypi.python.org/packages/source/N/Nikola/${_pyname}-${pkgver}.tgz")
md5sums=('84e1f2186b4c770023590d1b8e0e5250')

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -R "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}2-${pkgver}"
}

package_python-nikola() {
  depends=('python' 'python-doit' 'python-pygments' 'python-pillow'
           'python-docutils' 'python-mako' 'python-unidecode' 'python-lxml'
           'python-yapsy>=1.11.223' 'python-pyrss2gen' 'python-dateutil' 'python-logbook'
           'python-blinker' 'python-natsort' 'python-setuptools' 'python-requests')
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

package_python2-nikola() {
  depends=('python2' 'python2-doit' 'python2-pygments' 'python2-pillow'
           'python2-docutils' 'python2-mako' 'python2-unidecode' 'python2-lxml'
           'python2-yapsy>=1.11.223' 'python2-pyrss2gen' 'python2-dateutil' 'python2-logbook'
           'python2-blinker' 'python2-natsort' 'python2-setuptools' 'python2-requests')
  optdepends=('python2-markdown: for Markdown support'
              'python2-jinja: for Jinja2 themes'
              'python2-pyphen>=0.9.1: for hyphenation'
              'python2-pygal=1.7.0: for SVG graph plotting'
              'python2-typogrify>=2.0.4: for typographical enhancements'
              'python2-webassets: for bundling assets'
              'ipython2-notebook: for ipynb support'
              'ipython2: for ipynb support'
              'python2-ghp-import>=0.4.1: for uploading to GitHub Pages'
              'python2-micawber: for embedding media in posts'
              'python2-phpserialize: for WordPress imports'
              'python2-ws4py: for nikola auto'
              'python2-watchdog: for nikola auto')
  conflicts=('python2-nikola-git')
  cd "${srcdir}/${_pyname}2-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
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
