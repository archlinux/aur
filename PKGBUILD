# Maintainer: nroi <nroi@mailbox.org>

pkgname=clyde-client-git
pkgver=r9.a0e51f9
pkgrel=1
pkgdesc="Send currently installed packages to cpcache"
arch=('any')
url="https://github.com/nroi/clyde-client"
source=('git+https://github.com/nroi/clyde-client.git'
        'clyde_client.hook'
)
license=('MIT')
sha256sums=(
  'SKIP'
  '4fab0f70309ed9d784d6465c841d2689b1ae1492b1791750f294749aaf8b4289'
)
depends=('python' 'curl' 'sed' 'procps-ng' 'coreutils')

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "${pkgdir}/etc/clyde_client"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 clyde_client "${pkgdir}/usr/bin/clyde_client"
    install -Dm644 "${srcdir}/clyde_client.hook" "$pkgdir/usr/share/libalpm/hooks/clyde_client.hook"
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
