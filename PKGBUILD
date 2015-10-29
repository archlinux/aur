pkgname=pypam2-bzr
pkgver=17
pkgrel=1
arch=('any')
license=('GPL')
makedepends=('bzr')
depends=('pam' 'python2')
url="https://launchpad.net/ubuntu/quantal/+source/python-pam"
pkgdesc="A Python interface to the PAM library (configured to build for python2)"
conflicts=('pypam2')
provides=('pypam2')

_urel="quantal"
_bzrtrunk="http://bazaar.launchpad.net/~ubuntu-branches/ubuntu/${_urel}/python-pam/${_urel}"
_bzrmod=python-pam

build()
{
	cd "${srcdir}"
	if [[ -d "$_bzrmod" ]]; then
		cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
		msg "The local files are updated."
	else
		bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
		cd python-pam
	fi
	python2 setup.py build 
}

package()
{
	cd "${srcdir}/python-pam"
	python2 setup.py install --root="${pkgdir}"
}
