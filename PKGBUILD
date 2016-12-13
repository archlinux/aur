_gemname=chef_diff
_rubypath=/opt/chef/embedded/bin/
pkgname=ruby-chef-diff
pkgver=0.3.0
pkgrel=1
pkgdesc='Chef Diff is a library for calculating what Chef objects where modified between two revisions'
arch=(i686 x86_64)
url='https://github.com/One-com/chef_diff'
depends=(chef-client)
makedepends=(chef-client)
source=(git+https://github.com/One-com/chef_diff.git)
sha1sums=('SKIP')

build() {
	cd "$srcdir/${_gemname}"
	${_rubypath}/gem build chef_diff.gemspec
}

package() {
	cd "$srcdir/${_gemname}"

	local _gemdir="$(${_rubypath}/ruby -e'puts Gem.default_dir')"
	${_rubypath}/gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" $_gemname-$pkgver.gem
}
