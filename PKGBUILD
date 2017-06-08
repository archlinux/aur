# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=capistrano
pkgver=3.8.1
pkgrel=1
pkgdesc='A remote server automation and deployment tool written in Ruby.'
arch=(any)
url='http://capistranorb.com'
license=('MIT')
depends=(ruby ruby-capistrano-harrow ruby-sshkit ruby-i18n ruby-airbrussh)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem
        "https://raw.githubusercontent.com/$pkgname/$pkgname/v$pkgver/LICENSE.txt")
noextract=($pkgname-$pkgver.gem)
sha256sums=('3dfd6c113865fe0dee1f95c4a819ab85165a5948f25bace1559c6d272ee6ed15'
            'd18b2e881a5dfa2a913118db06f563ad24599a77887e20cf31443fdaf8d8fe6a')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
