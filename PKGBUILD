# Maintainer: Kaan Genç <SeriousBug at Gmail dot com>

pkgname=python-gist
pkgver=0.4.7
pkgrel=1
pkgdesc='Command line interface for working with GitHub gists.'
arch=(any)
url='https://github.com/jdowner/gist'
license=('MIT')
source=("https://pypi.org/packages/source/p/python-gist/python-gist-${pkgver}.tar.gz")
sha256sums=('f2fb022071fc26466f95ec69024d45fc83a6b296916ced73a2c26ac1f8994ef0')
depends=('python'
         'python-docopt'
         'python-gnupg'
         'python-requests'
         'python-simplejson')
provides=('gist')
conflicts=('gist'
           'gist-git'
           'ruby-gist')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	# Install ZSH completions if ZSH is installed too
	if [[ -f /usr/bin/zsh ]]; then
		install -Dm644 "$pkgdir/usr/share/gist/gist.zsh" "$pkgdir/usr/share/zsh/functions/Completion/Unix/_gist"
	fi
}
