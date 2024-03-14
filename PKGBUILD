pkgname=chunkcleaner-git
pkgver=0.0.10.r0.gcfd1e75e
pkgrel=1
pkgdesc="Minecraft tool to automatically delete unused chunks/region based on the time played in them."
arch=("any")
url="https://github.com/zeroBzeroT/ChunkCleaner"
license=("MIT")
depends=("glibc")
makedepends=("go" "git")
conflicts=("chunkcleaner")
backup=()
source=("git+https://github.com/zeroBzeroT/ChunkCleaner.git")
sha256sums=('SKIP')

function pkgver() {
	cd "${srcdir}/ChunkCleaner"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	cd "${srcdir}/ChunkCleaner"
}

function build() {
	cd "${srcdir}/ChunkCleaner"
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

function check() {
	cd "${srcdir}/ChunkCleaner"
	go test ./...
}

function package() {
	install -Dm755 "${srcdir}/ChunkCleaner/chunkCleaner" "${pkgdir}/usr/bin/chunkcleaner"
}

