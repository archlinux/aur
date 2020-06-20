# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=logdna-agent
_reponame=$pkgname-v2
pkgver=2.1.9
pkgrel=1
pkgdesc="The blazingly fast, resource efficient log collection client"
arch=('x86_64' 'aarch64') # From their package script, x86_64 and aarch64 are supported
url="https://github.com/logdna/${_reponame}"
license=("GPL2")
makedepends=(
    cargo
)
source=("https://github.com/logdna/logdna-agent-v2/archive/${pkgver}.zip")
sha512sums=('6934e595f17f722c6081ec32104f9d406306089c34d95ff5d0c1d87681734172b82e1c5f120e3760d72bfd32811c706814eb738d7c7830447981bb5f2e8b5b15')

build(){
    cd "$_reponame-$pkgver"
    cargo build --release --locked --all-features
}

package(){
    local sdir="$srcdir/$_reponame-$pkgver"
    install -Dm 755 -t "$pkgdir/usr/bin/" "$sdir/target/release/logdna-agent"
    install -Dm 644 -t "$pkgdir/usr/lib/systemd/system/logdna-agent.service" "$sdir/linux/logdna-agent.service"
}
