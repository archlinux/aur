# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="groupman-git"
_pkgname="groupman"
pkgver=r61.59e8ab1
pkgrel=1
pkgdesc="Gather your Arch Linux packages in groups to simplify their management."
url="https://github.com/StreakyCobra/groupman"
license=('MIT')
arch=('any')
depends=('git' 'python>=3.4' 'python-termcolor')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
changelog="ChangeLog"
source=("${_pkgname}::git+https://github.com/StreakyCobra/${_pkgname}.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}/"

    python setup.py install --root="$pkgdir/" --optimize=1

    install -D -m 755 'completions/zsh' "${pkgdir}/usr/share/zsh/site-functions/_grpman"
}

# vim:set ts=4 sw=4 et:
