# Maintainer: Joel Porquet <joel@porquet.org>

pkgname=php-remote-storage
pkgver=1.0.4
pkgrel=2
pkgdesc="remoteStorage server written in PHP"
arch=("any")
license=("agpl3")
url="https://github.com/fkooman/php-remote-storage"

source=("${url}/releases/download/1.0.4/php-remote-storage-${pkgver}.tar.xz")
md5sums=("a05597c68c937fd707cc8f28cb74f4eb")

instdir="usr/share/webapps/${pkgname}"
etcdir="etc/webapps/${pkgname}"
vardir="var/lib/${pkgname}"

build() {
    msg "Nothing to compile for ${pkgname}"
}

package() {
    _instdir="${pkgdir}/${instdir}"
    _etcdir="${pkgdir}/${etcdir}"
    _vardir="${pkgdir}/${vardir}"

    cd php-remote-storage-${pkgver}

    install -d "${_instdir}"
    cp -ra bin src vendor views web "${_instdir}"

    install -d "${_etcdir}"
    install -Dm640 -g http contrib/storage.local.conf.fedora "${_etcdir}/"
    install -Dm640 -g http contrib/storage.local.conf.ubuntu "${_etcdir}/"
    install -Dm640 -g http config/server.yaml.example "${_etcdir}/server.yaml"

    install -d "${_instdir}/config"
    ln -s "/${etcdir}/server.yaml" "${_instdir}/config/server.yaml"

    install -dm750 -o http -g http "${_vardir}/data"
    ln -s "/${vardir}/data" "${_instdir}/data"
}

backup=("${etcdir}/server.yaml")
