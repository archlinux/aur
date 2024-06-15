_basename=vlauncher
pkgname=${_basename}-ve
pkgver=1.0.3
pkgrel=1
pkgdesc="Launcher for Voxel Engine"
arch=(x86_64)
url="https://github.com/boolean-false/VLauncher-Releases"
makedepends=("wget" "curl" "jq" "tar")
depends=("jre17-openjdk")

_response=$(curl -L -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/repos/boolean-false/VLauncher-Releases/releases/latest)
_version=$(echo $_response | jq -r '.name')

prepare() {
    wget https://github.com/boolean-false/VLauncher-Releases/releases/download/${_version}/${_basename}-${_version}-linux-amd64.tar.gz

    tar -xvzf ${_basename}-${_version}-linux-amd64.tar.gz -C ./

    cd ${_basename}-${_version}

    sed -i 's/Exec.*/Exec=\/usr\/bin\/vlauncher/g' ./share/applications/io.github.dagger.vlaucnher.desktop
}

package() {
    cd ${_basename}-${_version}
    mkdir $pkgdir/usr

    cp -rt $pkgdir/usr bin lib share
}

