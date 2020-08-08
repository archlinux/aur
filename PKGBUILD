# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gonha-git
pkgver=1.7.4.r299.28293b0
pkgrel=1
pkgdesc='Light-weight system monitor for Linux'
arch=('any')
url='https://github.com/fredcox/gonha'
license=('MIT')
depends=('python-pyqt5'
         'python-ewmh'
         'python-psutil'
         'python-humanfriendly'
         'python-pathlib2'
         'python-pyinquirer'
         'python-distro'
         'python-py-cpuinfo'
         'python-requests'
         'python-netifaces'
         'python-country_list'
         'python-portolan'
         'python-unit-convert'
         'python-coloredlogs'
         'python-numpy'
         'python-pyamdgpuinfo'
         'python-babel'
         'python-i18n'
         'python-prompt_toolkit1014'
         'ttf-fira-code'
         'hddtemp')
makedepends=('python-setuptools' 'python-pip' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/fredcox/gonha.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s.r%s.%s" "$(pip show ${pkgname%-git} | grep Version | sed 's/Version: //')" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
