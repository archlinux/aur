# Maintainer: sommerfeld <sommerfeld@sommerfeld.dev>

_pkgname=sentrum
pkgname=$_pkgname-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Daemon that monitors watch-only bitcoin wallets"
arch=('x86_64')
url="https://github.com/sommerfelddev/$_pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64.tar.gz"
    "$url/releases/download/v$pkgver/$_pkgname-v$pkgver-manifest.txt"{,.asc})
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64.tar.gz"
    "$url/releases/download/v$pkgver/$_pkgname-v$pkgver-manifest.txt"{,.asc})
sha256sums_x86_64=('d1b3bc47f50c0be4ed17ac1db5d89dc44b9abded5985be7213628138f6e43330'
                   '071f9305d3f3247c2cce744b5442b8e3ede81992765ac9e65a3517937d5cb7c6'
                   'SKIP')
sha256sums_x86_64=('7ddf51ced99a93660b342361d877a1806ae7df5c1734546993eaf5dc09144806'
                   '071f9305d3f3247c2cce744b5442b8e3ede81992765ac9e65a3517937d5cb7c6'
                   'SKIP')
validpgpkeys=('B79DF5F37D7F9B0F390238D53298945F717C85F8')
backup=("etc/$_pkgname/$_pkgname.toml")
provides=('sentrum')
confllicts=('sentrum')

prepare() {
    sha256sum --check --ignore-missing "$_pkgname-v$pkgver-manifest.txt"
}

package() {
    cd "$_pkgname-v$pkgver-linux-x86_64"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"

    install -Dm644 "contrib/systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "contrib/systemd/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "contrib/systemd/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm644 "$_pkgname.sample.toml" "$pkgdir/etc/$_pkgname/$_pkgname.toml"

    install -Dm644 "man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
