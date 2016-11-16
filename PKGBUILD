# Maintainer: Kaan Genç <SeriousBug at Gmail dot com>

pkgname=python-gist
pkgver=0.4.1
pkgrel=1
pkgdesc='Command line interface for working with GitHub gists.'
arch=(any)
url='https://github.com/jdowner/gist'
license=('MIT')
source=("https://pypi.org/packages/source/p/python-gist/python-gist-${pkgver}.tar.gz")
md5sums=('c3bb628e13c6d456cfc1de87edcfd860')
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
