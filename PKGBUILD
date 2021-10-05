# Maintainer: HRKings <hrkings@***.com>
pkgname=pokemonsay-newgenerations-git
_pkgname=pokemonsay-newgenerations
pkgver=2.0.1
pkgrel=1
pkgdesc="Brings pokemon to the terminal using the power of cowsay."
arch=(any)
url="https://github.com/HRKings/pokemonsay-newgenerations.git"
license=('MIT')
depends=(cowsay)
provides=(pokemonsay)
source=("git+${url}")
md5sums=('SKIP')

package() {
	cd ${_pkgname}
	# Copy pokemon cowfiles
	rm -rf "${pkgdir}/opt/${_pkgname}/pokemons"
	mkdir -p "${pkgdir}/opt/${_pkgname}/pokemons"
  	cp ./pokemons/* "${pkgdir}/opt/${_pkgname}/pokemons/"

	# Install the README
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Put the installation path on the script
	sed -r "37s;.*;INSTALL_PATH=/opt/${_pkgname};" -i pokemonsay.sh

	# Change the pokemonthink to use the pokemonsay in the path
	sed -r "7s;.*;pokemonsay --think \$@;" -i pokemonthink.sh

	# Install the scripts	
  	install -Dm755 pokemonsay.sh "${pkgdir}"/usr/bin/pokemonsay
  	install -Dm755 pokemonthink.sh "${pkgdir}"/usr/bin/pokemonthink
}