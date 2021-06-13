_pkgname=wg-manager
pkgname="${_pkgname}-git"
pkgver=r171.0aec91c
pkgrel=1
pkgdesc="A easy to use WireGuard dashboard and management tool"
arch=("any")
url="https://github.com/perara/wg-manager"
license=("MIT")
depends=(
    "wireguard-tools" "uvicorn" "nodejs" "npm"
    "python" "python-pydantic" "python-fastapi" "python-aiofiles" "python-aiosqlite" "python-sqlalchemy" "python-databases" "python-pyjwt" "python-passlib" "python-bcrypt" "python-python-multipart" "python-jinja" "python-sqlalchemy-utils" "python-sqlalchemy-migrate" "python-requests" "python-uvloop" "python-httptools"
)
makedepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}/wg_dashboard_frontend"
    npm install
    npm install @angular/cli
    node_modules/@angular/cli/bin/ng build --configuration="production"
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/opt/"
    mv wg_dashboard_backend "${pkgdir}/opt/wg-manager"
    mv wg_dashboard_frontend/dist "${pkgdir}/opt/wg-manager/build"
}
