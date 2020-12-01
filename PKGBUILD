# Maintainer: Stanislav N. aka pztrn <pztrn@pztrn.name>
pkgname=taskfile-gotask-git
_pkgname=go-task
pkgver=3.0.0.r22.gb136166
pkgrel=1
pkgdesc="A task runner / simpler Make alternative written in Go. Compiled with 'go-task' as binary name to allow coexistance with taskwarrior."
arch=('any')
license=('MIT')
depends=()
url="https://github.com/go-task/task"
makedepends=('go' 'git')
source=("$_pkgname::git://github.com/go-task/task#branch=${BRANCH:-master}")
md5sums=('SKIP')
backup=()

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${srcdir}/${_pkgname}/cmd/task"
    go build -gcflags "-trimpath ${srcdir}/${_pkgname}" -o ${_pkgname}
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/cmd/task/go-task" "${pkgdir}/usr/bin/go-task"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "$srcdir/${_pkgname}/completion/bash/task.bash" "$pkgdir/usr/share/bash-completion/completions/go-task"
    install -Dm644 "$srcdir/${_pkgname}/completion/zsh/_task" "$pkgdir/usr/share/zsh/site-functions/_go-task"
}

