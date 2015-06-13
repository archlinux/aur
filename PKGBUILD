# Maintainer: Kaan Genç <SeriousBug at Gmail dot com>

pkgname=python-gist
pkgver=0.3.2
pkgrel=1
pkgdesc='Command line interface for working with GitHub gists.'
arch=(any)
url='https://github.com/jdowner/gist'
license=('MIT')
source=("https://pypi.python.org/packages/source/p/python-gist/python-gist-${pkgver}.tar.gz")
md5sums=('47b0b5f32501d0bf0ae4a8a0810a5917')
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
