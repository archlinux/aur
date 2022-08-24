# Maintainer: Ayush Jaipuriyar <ayushjaipuriyar21@gmail.com>
pkgname=vantage-14are05-git
_gitname=vantage-14are05
_name=vantage
pkgver=26__2022.08.24
pkgrel=1
pkgdesc="Battery manager to handle system performance modes and charge modes 
        through acpi_calls (for ideapad 14are05 only)."
url="https://github.com/ayushjaipuriyar/${_gitname}"
arch=('x86_64')
license=('GPL3')
depends=('acpi_call')
makedepends=('git')
provides=('battmngr')
provides=(${_name})
source=("git+$url")
sha256sums=('SKIP')
md5sums=("SKIP")

pkgver() {
    cd ${_gitname}
    _tag=$(git describe --tags | sed 's:^v::') # tag is mobile, and switches between numbers and letters, can't use it for versioning
    _commits=$(git rev-list --count HEAD) # total commits is the most sane way of getting incremental pkgver
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s_%s\n" "${_commits}" "${_tag}" "${_date}" | sed 's/-/./g'
}

package() {
    cd ${_gitname}
    install -D vantage.sh "${pkgdir}/usr/bin/${_name}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
