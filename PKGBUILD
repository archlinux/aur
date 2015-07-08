# Maintainer: Jérôme M. Berger <jeberger@free.fr>
# Contributor: Gour-Gadadhara Dasa <gour@atmarama.net>
# Contributor: Paul Barker <paul@paulbarker.me.uk>

name=hgshelve
pkgname=$name-hg
pkgver=107.b81580adae4e
pkgrel=1
pkgdesc="Shelve Extension for Mercurial"
arch=(any)
url="http://mercurial.selenic.com/wiki/ShelveExtension"
license=('GPL2')
depends=('mercurial')
makedepends=('mercurial')

source=("hg+https://bitbucket.org/astiob/hgshelve" "hgshelve.rc")
sha256sums=("SKIP" "c1e301c97ef6be7a0cbeb0d342a617e4814303551810b8f77a7e226336654a63")

package() {
  cd "$srcdir/$name"
  python_version=$(python2 -V 2>&1 | cut -d' ' -f2 | cut -d'.' -f1,2)
  install -m0644 -D hgshelve.py $pkgdir/usr/lib/python${python_version}/site-packages/hgext/hgshelve.py
  install -m0644 -D "${srcdir}/hgshelve.rc" "${pkgdir}/etc/mercurial/hgrc.d/hgshelve.rc"
}

pkgver() {
  cd "$srcdir/$name"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}
