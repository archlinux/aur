# Maintainer: Manuel Gugger <mdgdot[at]tutanota[dot]com>

pkgname=act-runner-bin
pkgver=0.2.6
pkgrel=2
pkgdesc="A runner for Gitea Actions based on GitHub's Act"
arch=('x86_64')
url="https://gitea.com/gitea/act_runner"
license=('MIT')
optdepends=('docker: for running containers')
provides=('act_runner')
conflicts=('act_runner')

source_x86_64=("https://gitea.com/gitea/act_runner/releases/download/v${pkgver}/act_runner-${pkgver}-linux-amd64.xz")
sha256sums_x86_64=('8abae07c3c57fad9a79f0ac97f9c11678b90bce70397d76dfb31c73f78285073')

source=('act_runner.service'
        'act_runner.yaml'
        'act_runner.sysusers'
        'act_runner.tmpfiles')
sha256sums=('245f610f82bcb5140d9040f997332186c03a575b98cce603e39f1f0300773e3e'
            '3b808516653896f1feffe1ef4f052875fc85cd5b25d0b172f0f78ddd48b888eb'
            'cb2bd209ae841c78f2b9e839724fd4a323f1d635a97b0206d7056b7f0cb290b4'
            '5f8944df92d0e5278e3a29795dfcd8bcd340bea37075627d4f9d3303cdb58607')

package() {
    mv act_runner-${pkgver}-linux-amd64 act_runner
    install -Dm755 act_runner -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/act_runner.service" "$pkgdir/usr/lib/systemd/system/act_runner.service"
    install -Dm644 "$srcdir/act_runner.yaml" "$pkgdir/etc/act_runner/act_runner.yaml"
    install -Dm644 "$srcdir/act_runner.sysusers" "$pkgdir/usr/lib/sysusers.d/act_runner.conf"
    install -Dm644 "$srcdir/act_runner.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/act_runner.conf"
}
