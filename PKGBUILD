# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
# Contributor: Egor Kuropatkin <egor.k8n@gmail.com>
# Contributor: Egor Laufer <egor.l4r@gmail.com>
#
name=hg-git
pkgname=$name-hg
pkgver=1774.b963d11cc1c8
pkgrel=1
pkgdesc="the Hg-Git mercurial plugin"
arch=(any)
url="http://hg-git.github.io/"
license=('GPL2')
depends=('mercurial' 'python-dulwich')
makedepends=('mercurial' 'python-setuptools')
provides=('hg-git')
conflicts=('hg-git')
source=('hg+https://foss.heptapod.net/mercurial/hg-git'
        'hggit.rc')
md5sums=('SKIP'
         '592a454e09f498074c57a5b7e383e808')

pkgver() {
    cd "$srcdir/$name"
    hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

package() {
    cd $srcdir/$name
    python setup.py install --prefix=/usr --root=$pkgdir
    install -m0644 -D "${srcdir}/hggit.rc" "${pkgdir}/etc/mercurial/hgrc.d/hggit.rc"
}
