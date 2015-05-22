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
        gitlab-ci-runner.install)
md5sums=('6cd87adb07405a2fa0acbefe31fef5c1'
         'af4748081599d3379ab63fb2f6e4e94f'
         '6c24857d02eba34082ba0437daa6e91d')

package() {
  cp -r "$srcdir/gitlab-ci-runner.git" "$pkgdir/usr/lib/${pkgname}"

  # Create systemd service
  install -Dm644 "$srcdir/gitlab-ci-runner.service" "$pkgdir/usr/lib/systemd/system/gitlab-ci-runner.service"
    echo "Install the gems for the runner: bundle install --deployment"
}
