# Maintainer: fzerorubigd <fzero@rubi.gd>
# Contributer: Simon Legner <Simon.Legner@gmail.com>
pkgname=('gitsome-git')
pkgver=0.6.0.r30.g1d9b6b3
pkgrel=1
pkgdesc="A Supercharged Git/Shell Autocompleter with GitHub Integration."
url="https://github.com/donnemartin/gitsome"
depends=('python' 'python-ply' 'python-prompt_toolkit' 'python-requests' 'python-colorama' 'python-click' 'python-pygments' 'python-feedparser' 'python-pytz' 'python-docopt' 'python-uritemplate.py' 'python-numpydoc')
makedepends=('python-setuptools')
conflicts=('xonsh' 'python-gitsome' 'gitsome')
provides=('gitsome')
license=('APACHE')
arch=('any')
source=("git://github.com/donnemartin/gitsome.git")
md5sums=('SKIP')

pkgver () {
    cd gitsome
    # (last-tag).r(revisions-since).(latest-commit-hash)
    git describe | sed 's/-/.r/; s/-/./'
}

build() {
    cd "${srcdir}/gitsome"
    git checkout develop
    python setup.py build
}

package() {
    cd "${srcdir}/gitsome"
    git checkout develop
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
