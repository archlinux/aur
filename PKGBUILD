# Maintainer: Tim van Leuverden <Timmy1e [at] protonmail [dot] ch>

pkgname=rocketchat-server-docker
_pkgname=rocketchat-server
pkgver=0.68.4
pkgrel=1
pkgdesc="An open source web chat platform, docker-compose package for minimal setup."
arch=("any")
conflicts=("rocketchat-server")
url="https://rocket.chat/"
license=("MIT")
depends=(
	"docker"
	"docker-compose"
)
backup=(
	"etc/rocketchat-server/config.env"
	"etc/rocketchat-server/docker.env"
)
source=(
	"https://github.com/Timmy1e/rocket.chat-docker/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz"
	"createEnvFile.sh"
	"config.env"
	"docker.env"
	"${_pkgname}.env"
	"${_pkgname}.install"
	"${_pkgname}.yml"
	"rocketchat.service"
)
noextract=("${_pkgname}-${pkgver}.tar.xz")
sha512sums=(
	"8bb37bad564df038f5c366c5be0eb9e52f166eb4245a6c88b584d0322e63a78150f79f7a0ac3cbcf4056030c6e4623705c3d6bd48d56573f6a9c1217be746c1e"
	"3c7ade4d47f6e8f94a7b2922bbc72d280ff68ed1672747b94f50df579d6071f2b2d6df80448ba4ba1f5bb9aa1517182807292168d4c097ccc5928b46c8eea1cb"
	"db54d0809ff04e2adaba23c3e80dca95ff13660b342cde89c7bd0df42962f09af563b5405084f477fdc0d59ae4f176e453228a4eb3c1a7e86397579bded43f81"
	"ffcd88ca7603f732b972bf94f973f94a240c5db0521f5e4b17fcfab7d6773e076ff91c5cbac821e9b99045936daab6f0224f8d8e50b0094d91e577785b19dc39"
	"897d36d5b0d7a2b8e432db779977c97970b116ab4c3092dd8c6da9d03ecef653e9a1867a8e20618143afd164c3d2632805510962d098b442670210e1d07bb0ee"
	"5f93f8c593438c3c815e9197996120bc52c45d7b8db94591217925ed4b3a654df241e54363d256a4a94f04f4eee24c8c0069a592626a15487ce9bba6db0a0799"
	"b7e4e516679c367669d45c93f106455e40e06c17c3766d4a43cb2d5c32ab8f83045c1c19d3041642a2bef5360f51b763fe4e291040515f2505d4c341d1502886"
	"3d09fceaa80d9f9a13523df016f53730ecd4733263d3988dea31ad3eda3ed6a0976e536d24acea5ccbbfdf5a4564208473614fecbb4a42ec8b6335a04069cabf"
)
install="${_pkgname}.install"
package() {
	mkdir -p ${pkgdir}/usr/share/${_pkgname}/data/
	install -Dm744 createEnvFile.sh ${pkgdir}/usr/share/${_pkgname}/createEnvFile.sh
	install -Dm644 ${_pkgname}-${pkgver}.tar.xz ${pkgdir}/usr/share/${_pkgname}/${_pkgname}-${pkgver}.tar.xz
	install -Dm644 ${_pkgname}.env ${pkgdir}/usr/share/${_pkgname}/config.env
	install -Dm644 ${_pkgname}.yml ${pkgdir}/usr/share/${_pkgname}/docker-compose.yml
	install -Dm644 rocketchat.service ${pkgdir}/usr/lib/systemd/system/rocketchat.service
	install -Dm644 config.env ${pkgdir}/etc/${_pkgname}/config.example.env
	install -Dm644 docker.env ${pkgdir}/etc/${_pkgname}/docker.example.env
	install -Dm644 config.env ${pkgdir}/etc/${_pkgname}/config.env
	install -Dm644 docker.env ${pkgdir}/etc/${_pkgname}/docker.env

	echo "x_TAG=${pkgver}" > ${pkgdir}/usr/share/${_pkgname}/docker.env
}

