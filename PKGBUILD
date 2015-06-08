# Maintainer: mawcomw <mawcomw@gmail.com>
pkgname=gitlab-ci-runner
pkgver=5.2.1
pkgrel=1
pkgdesc="Gitlab-CI runner"
arch=('any')
url="https://github.com/gitlabhq/gitlab-ci-runner"
license=('GPL2')
depends=('ruby'
         'libxml2'
         'libxslt'
         'git')
provides=('gitlab-ci-runner')
install=gitlab-ci-runner.install
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/gitlab-org/gitlab-ci-runner/repository/archive.tar.gz?ref=v${pkgver}"
        gitlab-ci-runner.service
        gitlab-ci-runner.install
        gitlab-ci-runner.sh)
md5sums=('6cd87adb07405a2fa0acbefe31fef5c1'
         'af4748081599d3379ab63fb2f6e4e94f'
         '6c24857d02eba34082ba0437daa6e91d'
         'c8fcc9f0193d9cc80a74f9e4cf213977')

package() {
  mkdir -p "$pkgdir/usr/lib"
  cp -r "$srcdir/gitlab-ci-runner.git" "$pkgdir/usr/lib/${pkgname}"

  # Create systemd service
  install -Dm644 "$srcdir/gitlab-ci-runner.service" "$pkgdir/usr/lib/systemd/system/gitlab-ci-runner.service"
  install -Dm777 "$srcdir/gitlab-ci-runner.sh" "$pkgdir/usr/bin/gitlab-ci-runner"
}
