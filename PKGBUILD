# Maintainer: Manuel Gugger <mdgdot[at]tutanota[dot]com>

pkgname=act-runner-bin
pkgver=0.2.6
pkgrel=1
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
        'act_runner.yaml')
sha256sums=('c4438cbc1e7e542bf5308a5b03202ddfde765b83b42cf428342e1da02998a160'
            '7141bcb6048d3404432dfaabc844139dbd3262fc93651700396dea3faa498c45')

package() {
    mv act_runner-${pkgver}-linux-amd64 act_runner
    install -Dm755 act_runner -t "$pkgdir/usr/bin"

    # install service
    install -Dm644 "$srcdir/act_runner.service" "$pkgdir/usr/lib/systemd/system/act_runner.service"

    # install config
    install -Dm644 "$srcdir/act_runner.yaml" "$pkgdir/etc/act_runner/act_runner.yaml"
}
