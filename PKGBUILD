# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Contributor: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>
pkgbase=nikola
_pyname=Nikola
pkgname=nikola
pkgver=7.8.10
pkgrel=2
pkgdesc='A modular, fast, simple, static website generator.'
arch=('any')
url='https://getnikola.com/'
license=('MIT')
options=(!emptydirs)
depends=('python' 'python-doit' 'python-pygments' 'python-pillow'
         'python-docutils' 'python-mako' 'python-unidecode' 'python-lxml'
         'python-yapsy>=1.11.223' 'python-pyrss2gen' 'python-dateutil' 'python-logbook'
         'python-blinker' 'python-natsort' 'python-setuptools'
         'python-requests' 'python-husl' 'python-piexif' 'python-markdown')
optdepends=('python-jinja: for Jinja2 themes'
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
source=("https://pypi.io/packages/source/N/Nikola/${_pyname}-${pkgver}.tar.gz")
md5sums=('a3a4e7f5417f6ce19b6edbbe8b778131')

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
}

package() {
  conflicts=('python-nikola-git')
  replaces=('python-nikola' 'python2-nikola')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  ln -s ${pkgbase} "${pkgdir}/usr/bin/${pkgbase}3"
  rm -rf "${pkgdir}/usr/share"

  install -d -m755 "${pkgdir}/usr/share"/{doc/${pkgbase},man/man1,licenses/${pkgbase}}
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  cd "docs/"
  install -m644 man/nikola.1.gz "${pkgdir}/usr/share/man/man1/nikola.1.gz"
  install -m644 manual.txt "${pkgdir}/usr/share/doc/${pkgbase}/manual.txt"
  install -m644 theming.txt "${pkgdir}/usr/share/doc/${pkgbase}/theming.txt"
  install -m644 extending.txt "${pkgdir}/usr/share/doc/${pkgbase}/extending.txt"
}

# vim:set ts=2 sw=2 et:
