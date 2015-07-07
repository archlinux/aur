# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Contributor: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>
pkgbase=python-nikola-git
_pyname=nikola
_gitname=nikola
pkgname=('python-nikola-git' 'python2-nikola-git' 'python-nikola-doc-git')
pkgver=7.6.0.r43.gc8f7a6a
pkgrel=1
pkgdesc='A modular, fast, simple, static website generator. (git version)'
arch=('any')
url='https://getnikola.com/'
license=('MIT')
options=(!emptydirs)
makedepends=('git' 'python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("git+https://github.com/getnikola/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${srcdir}/${_gitname}"
  cp -R "${srcdir}/${_gitname}" "${srcdir}/${_gitname}2"
}

package_python-nikola-git() {
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
  conflicts=('python-nikola')
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  ln -s ${_pyname} "${pkgdir}/usr/bin/${_pyname}3"
  rm -rf "${pkgdir}/usr/share"
}

package_python2-nikola-git() {
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
  conflicts=('python2-nikola')
  cd "${srcdir}/${_gitname}2"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  mv "${pkgdir}/usr/bin/${_pyname}" "${pkgdir}/usr/bin/${_pyname}2"
  rm -rf "${pkgdir}/usr/share"
}

package_python-nikola-doc-git(){
  pkgdesc="Nikola documentation, license and man page"
  conflicts=('python-nikola-doc')

  cd "${srcdir}/${_gitname}"
  install -d -m755 "${pkgdir}/usr/share"/{doc/${pkgbase},man/man1,licenses/${pkgbase}}
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  cd "docs/"
  install -m644 man/nikola.1.gz "${pkgdir}/usr/share/man/man1/nikola.1.gz"
  install -m644 manual.txt "${pkgdir}/usr/share/doc/${pkgbase}/manual.txt"
  install -m644 theming.txt "${pkgdir}/usr/share/doc/${pkgbase}/theming.txt"
  install -m644 extending.txt "${pkgdir}/usr/share/doc/${pkgbase}/extending.txt"
}

# vim:set ts=2 sw=2 et:
