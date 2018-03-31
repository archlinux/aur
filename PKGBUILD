# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Contributor: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>
_pyname=nikola
_gitname=nikola
pkgname=nikola-git
pkgver=7.8.14.r1.gfee4d191
pkgrel=1
pkgdesc='A modular, fast, simple, static website generator. (git version)'
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
makedepends=('git')
source=("git+https://github.com/getnikola/${_gitname}.git" "make_tab_completion.py")
md5sums=('SKIP' '0c5b36c239ac465da024dac76e4892e7')
conflicts=('python-nikola' 'python2-nikola' 'python-nikola-git' 'python2-nikola-git' 'nikola')
replaces=('python-nikola-git' 'python2-nikola-git' 'python-nikola-doc-git')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

package() {
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  ln -s ${_gitname} "${pkgdir}/usr/bin/${_gitname}3"

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m644 docs/man/nikola.1.gz "${pkgdir}/usr/share/man/man1/nikola.1.gz"
  install -m644 docs/manual.txt "${pkgdir}/usr/share/doc/${pkgname}/manual.txt"
  install -m644 docs/theming.txt "${pkgdir}/usr/share/doc/${pkgname}/theming.txt"
  install -m644 docs/extending.txt "${pkgdir}/usr/share/doc/${pkgname}/extending.txt"

  export pkgdir
  python3 ../make_tab_completion.py
}

# vim:set ts=2 sw=2 et:
