# Maintainer: nckslvrmn <nckslvrmn@gmail.com>
pkgname=amazon-ecs-init
pkgver=1.82.3
pkgrel=1
pkgdesc="Amazon ECS Init"
arch=('x86_64')
url="https://github.com/aws/amazon-ecs-init"
license=('APACHE')
groups=()
depends=('glibc')
provides=("${pkgname}")
source=(https://s3.us-east-1.amazonaws.com/amazon-ecs-agent-us-east-1/${pkgname}-${pkgver}-${pkgrel}.amd64.deb)
md5sums=('99fb1e1812ff2999af9f2275590641e6')
noextract=()

prepare() {
    cd "$srcdir"
    tar -xf data.tar.xz
}

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir"/usr/
    cp -R "${srcdir}"/usr/ "${pkgdir}"

    install -dm755 "$pkgdir"/etc/ecs/
    cp -R "${srcdir}"/etc/ecs/ "${pkgdir}/etc/"

    install -dm755 "$pkgdir"/var/
    cp -R "${srcdir}"/var/ "${pkgdir}"

    install -Dm644 \
        "$srcdir"/lib/systemd/system/amazon-ecs-volume-plugin.service \
        "$pkgdir"/usr/lib/systemd/system/amazon-ecs-volume-plugin.service

    install -Dm644 \
        "$srcdir"/lib/systemd/system/amazon-ecs-volume-plugin.socket \
        "$pkgdir"/usr/lib/systemd/system/amazon-ecs-volume-plugin.socket

    install -Dm644 \
        "$srcdir"/lib/systemd/system/ecs.service \
        "$pkgdir"/usr/lib/systemd/system/ecs.service

}
