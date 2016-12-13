_gemname=running_sushi
_rubypath=/opt/chef/embedded/bin/
pkgname=ruby-running-sushi
pkgver=0.5.0
pkgrel=1
pkgdesc='Running Sushi, software to keep cookbooks, clients, databags, environments, nodes, roles and users in sync'
arch=(i686 x86_64)
url='https://github.com/One-com/running_sushi'
depends=(chef-client ruby-chef-diff)
makedepends=(chef-client)
source=(git+https://github.com/One-com/running_sushi.git)
sha1sums=('SKIP')

build() {
	cd "$srcdir/${_gemname}"
	${_rubypath}/gem build running_sushi.gemspec
}

package() {
	cd "$srcdir/${_gemname}"

	local _gemdir="$(${_rubypath}/ruby -e'puts Gem.default_dir')"
	${_rubypath}/gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" running_sushi-$pkgver.gem
}
