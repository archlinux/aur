# Maintainer: sh0rez <me@shorez.de>

pkgname=docker-compose1
pkgver=1.29.2
pkgrel=1
pkgdesc="Fast, isolated development environments using Docker. 1.x branch"
arch=('any')
url="https://github.com/docker/compose"
license=("Apache")
depends=('python-cached-property' 'python-docopt' 'python-yaml' 'python-requests'
         'python-texttable' 'python-websocket-client' 'python-distro' 'python-docker'
         'python-dockerpty' 'python-six' 'python-jsonschema' 'python-dotenv' 'docker')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/docker/compose/archive/$pkgver.tar.gz")
sha512sums=('09f2ae2ae7a17ab5fb3e22580f7a80f1a8253f7ad9fc8f29aca432911bcde46ed22030ff3073cdd7eff3d55aaba17f56e628a178ec05c3a9b4f28495d6045111')

build() {
  cd "compose-$pkgver"
  python setup.py build
}

package() {
  cd "compose-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 contrib/completion/bash/docker-compose      "$pkgdir"/usr/share/bash-completion/completions/docker-compose
  install -Dm644 contrib/completion/fish/docker-compose.fish "$pkgdir"/usr/share/fish/vendor_completions.d/docker-compose.fish
  install -Dm644 contrib/completion/zsh/_docker-compose      "$pkgdir"/usr/share/zsh/site-functions/_docker-compose
}
