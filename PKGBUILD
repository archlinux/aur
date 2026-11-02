pkgname=oranglauncher-bin
pkgver=8.5.1
pkgrel=2
pkgdesc="Orange Launcher for Arch Linux"
arch=(x86_64)
url="https://oranges.lt"
license=('GPL3')
depends=(glibc webkit2gtk-4.1 gtk3 python-gobject)
provides=(oranglauncher)
conflicts=(oranglauncher)
options=(!debug)

source=("https://github.com/Orang-Studio/OrangLaunch/releases/download/8.5.1-Linux/launcher_x64_linux_${pkgver}.tar.gz"
        "LICENSE"
        "oranglauncher-mime.xml")
sha256sums=('9b2d30b8c8707fe552bb0c096efc196d3f0799ef3bdaef78aed81ff5fecf3927'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '2d0cdbad857e3b7fe79c41f981a89ad1c595d54e43884b3fd5d89892ec0bf07c')

package() {
    install -d "$pkgdir/usr/lib/oranglauncher"
    install -d "$pkgdir/usr/bin"
    tar -xzf "$srcdir/launcher_x64_linux_${pkgver}.tar.gz" -C "$pkgdir/usr/lib/oranglauncher"
    chmod -R a+rX "$pkgdir/usr/lib/oranglauncher"
    find "$pkgdir/usr/lib/oranglauncher" -type d -exec chmod 0755 {} +
    find "$pkgdir/usr/lib/oranglauncher" -type f -perm /111 -exec chmod 0755 {} +
    find "$pkgdir/usr/lib/oranglauncher" -type f ! -perm /111 -exec chmod 0644 {} +
    ln -s /usr/lib/oranglauncher/launcher.bin "$pkgdir/usr/bin/oranglauncher"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/oranglauncher-mime.xml" "$pkgdir/usr/share/mime/packages/oranglauncher.xml"
}
