# -*- shell-script -*-
# Arch Linux package build script
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
# Contributor: Egor Kuropatkin <egor.k8n@gmail.com>
# Contributor: Egor Laufer <egor.l4r@gmail.com>
#
name=hg-git
pkgname=$name-hg
pkgver=631.711baa274f78
pkgrel=1
pkgdesc="the Hg-Git mercurial plugin"
arch=(any)
url="http://hg-git.github.com/"
license=('GPL2')
depends=('mercurial' 'python2-dulwich')
makedepends=('mercurial')
provides=('hg-git')
conflicts=('hg-git')
source=('hg+https://bitbucket.org/durin42/hg-git'
        'hggit.rc')
md5sums=('SKIP'
        '592a454e09f498074c57a5b7e383e808')

pkgver() {
    cd "$srcdir/$name"
    hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

package() {
    cd $srcdir/$name
    python2 setup.py install --prefix=/usr --root=$pkgdir
    install -m0644 -D "${srcdir}/hggit.rc" "${pkgdir}/etc/mercurial/hgrc.d/hggit.rc"
}

# Changelog
################################################################################
# * Sun Jul 19 2015 Egor Laufer <egor.l4r@gmail.com>
# - Moved package to aur4
#
# * Fri Nov 29 2013 Egor Kuropatkin <egor.k8n@gmail.com>
# - Replaced python-dulwich dependency with python2-dulwich
#
# * Thu Aug 08 2013 Egor Kuropatkin <egor.k8n@gmail.com>
# - Add pkgver function.
# - Add hggit.rc: this file will be placed to /etc/merucrial/hgrc.d/ to enable
#   hggit extention by default.
# - Remove .install file
