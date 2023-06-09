# Maintainer: honjow
pkgname=sk-holoiso-config
pkgver=r7.0a8ebd7
pkgrel=1
pkgdesc="A custom configs for sk-holoiso"
arch=('any')
url="https://github.com/honjow/sk-holoiso-config"
license=('MIT')
makedepends=('git')
aurdepends=('holo-gs-auto-update')
provides=(sk-holoiso-config)
conflicts=(sk-holoiso-config)
source=("git+$url")
sha256sums=('SKIP')
options=(!strip)
install=sk-holoiso-config.install

pkgver() {
    cd "$srcdir/sk-holoiso-config"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    source_services=("sk-auto-swap.service" "sk-efi-mount.service")

    cd "$srcdir/sk-holoiso-config/src"
    for service_file in "${source_services[@]}"; do
        install -Dm644 "$srcdir/sk-holoiso-config/src/etc/systemd/system/$service_file" "$pkgdir/etc/systemd/system/$service_file"
    done

    exclude_files=("sk-auto-swap" "sk-efi-mount")
    for exclude_file in "${exclude_files[@]}"; do
        install -Dm755 "$srcdir/sk-holoiso-config/src/usr/bin/$exclude_file" "$pkgdir/usr/bin/$exclude_file"
    done

}
