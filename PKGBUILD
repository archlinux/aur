# Maintainer: Luke Yue <lukedyue@gmail.com>
# Maintainer: asdf12303116  <a675750333@gmail.com>

pkgname=clash-dev-git
pkgver=20191211.r318.95e9ae2
pkgrel=1
pkgdesc="A rule based proxy in Go."
arch=('x86_64')
url="https://github.com/Dreamacro/clash"
license=('MIT')
provides=("clash")
conflicts=("clash-bin" "clash")
makedepends=('go' 'git')
depends=('glibc')

source=("clash@.service"
        "clash_user.service"
        "git+https://github.com/Dreamacro/clash#branch=dev"
        "https://raw.githubusercontent.com/Dreamacro/clash/master/LICENSE")

sha512sums=('e9e215e0a06d0d1072467342dd72e777725b94634714c5bd5fdee31f48897d9b8ab7e83830d836533d6862fa6ebfda56dbf138edd873140de61d8ccdf2a54572'
            '338c3a5904623bec48c03b2ef8cf452979c229fc5b89b2e0447664b40cd6e29c83cae47a19145be76d3ee2f0b6a54184a0cff69b834ba6107b444caacc02decf'
'SKIP'
            '46478b083104014b881ad546b89cfb16f040588f38e8c04ca664078061ba0e0653a394365d128410a9646f9159c9d9c7644a3ea42b22e4a4f240dfd6bea666c5')

pkgver() {
    cd "${srcdir}/clash"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

build() {
    cd "${srcdir}/clash"
    go build .
}

package() {
    cd "${srcdir}/clash"
    install -Dm755 "clash" "${pkgdir}/usr/bin/clash"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/clash/LICENSE"
    install -Dm644 "${srcdir}/clash@.service" "${pkgdir}/usr/lib/systemd/system/clash@.service"
    install -Dm644 "${srcdir}/clash_user.service" "${pkgdir}/usr/lib/systemd/user/clash.service"
}

