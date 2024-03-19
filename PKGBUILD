# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
# Contributor: Egor Kuropatkin <egor.k8n@gmail.com>
# Contributor: Egor Laufer <egor.l4r@gmail.com>
#
_name=hg-git
pkgname=$_name-hg
pkgver=1951.e799e4fad448
pkgrel=1
pkgdesc="the Hg-Git mercurial plugin"
arch=(any)
url="http://hg-git.github.io/"
license=('GPL2')
depends=('mercurial' 'python-dulwich')
makedepends=('mercurial' 'python-setuptools-scm'
             'python-build' 'python-installer'
             'python-wheel')
provides=('hg-git')
conflicts=('hg-git')
source=('hg+https://foss.heptapod.net/mercurial/hg-git'
        'hggit.rc')
md5sums=('SKIP'
         '592a454e09f498074c57a5b7e383e808')

pkgver() {
    cd "$srcdir/$_name"
    hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

build() {
    cd "$srcdir/$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -m0644 -D "${srcdir}/hggit.rc" "${pkgdir}/etc/mercurial/hgrc.d/hggit.rc"
}
