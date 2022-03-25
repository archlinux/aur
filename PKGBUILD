# Maintainer: s3lph <account-arch-aur-gzxkqqna@kernelpanic.lol>
_reponame=fast_diff_match_patch
_pyname=diff_match_patch_python
pkgname=python-diff-match-patch-cpp-git
pkgver=1.0.3.r36.2ddbcc2
pkgrel=1
epoch=1
pkgdesc="A Python extension module that wraps Google's diff_match_patch C++ implementation for very fast string comparison."
arch=('x86_64')
url="https://github.com/JoshData/fast_diff_match_patch/tree/1.0.x-final"
license=('custom:CC0')
groups=()
depends=('python')
makedepends=('git' 'gcc' 'python-setuptools')
provides=('python-diff-match-patch-cpp' 'python-fast-diff-match-patch')
conflicts=('python-diff-match-patch-cpp' 'python-diff-match-patch')
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/JoshData/fast_diff_match_patch')
noextract=()
md5sums=('SKIP')


prepare() {
    cd "$srcdir/${_reponame}"
    git checkout 1.0.x-final
    git submodule update --init
    python setup.py egg_info
}

pkgver() {
    cd "$srcdir/${_reponame}"
    printf "%s.r%s.%s" "$(grep '^Version:' ${_pyname/-/_}.egg-info/PKG-INFO | cut -d' ' -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_reponame}"
    python setup.py build
}

package() {
    cd "$srcdir/${_reponame}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
